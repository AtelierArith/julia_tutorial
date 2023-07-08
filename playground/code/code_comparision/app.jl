# app.jl
using Dash
using DashBootstrapComponents

using IOCapture
using InteractiveUtils: clipboard

app = dash(external_stylesheets=[dbc_themes.BOOTSTRAP])

app.layout = dbc_container(className="mxy-auto") do
    html_h1("Code Comparision Tool"),
    html_div("Put your code before including codeA and codeB"),
    dcc_textarea(
        id="text-code-common",
        placeholder="common code",
        rows=10,
        style=Dict(:width => "100%"),
    ),
    html_div(id="result-common"),
    dbc_row([
        dbc_col([
            html_h2("codeA"),
            dcc_textarea(
                id="text-codeA",
                placeholder="codeA",
                value="",
                rows=2,
                style=Dict(:width => "100%"),
            ),
        ]),
        dbc_col([
            html_h2("codeB"),
            dcc_textarea(
                id="text-codeB",
                placeholder="codeB",
                value="",
                rows=2,
                style=Dict(:width => "100%"),
            ),
        ]),
    ],),
    dbc_row([
        dbc_col(
            dbc_button(
                "Compare",
                id="button-compare",
                color="primary",
                className="margin-auto",
                size="sm",
            ),
        ),
    ],),
    html_h3("Result", style=Dict("text-align" => "center")),
    dbc_row([
        dbc_col(
            dcc_textarea(
                id="text-resultA",
                placeholder="resultA",
                value="",
                rows=10,
                readOnly=true,
                style=Dict(:width => "100%"),
            ),
        ),
        dbc_col(
            dcc_textarea(
                id="text-resultB",
                placeholder="resultB",
                value="",
                rows=10,
                readOnly=true,
                style=Dict(:width => "100%"),
            ),
        ),
    ],),
    dbc_row([
        dbc_col(dbc_button("Copy result A", id="button-copyA", color="primary")),
        dbc_col(dbc_button("Copy result B", id="button-copyB", color="primary")),
    ],),
    html_div("dummy-resultA", id="dummy-resultA", style=Dict("display" => "none")),
    html_div("dummy-resultB", id="dummy-resultB", style=Dict("display" => "none")),
    html_div("dummy-codeA", id="dummy-codeA", style=Dict("display" => "none")),
    html_div("dummy-codeB", id="dummy-codeB", style=Dict("display" => "none"))
end

# Taken from Literate.jl and modified
function sandbox()
    m = Module(gensym())
    # eval(expr) is available in the REPL (i.e. Main) so we emulate that for the sandbox
    Core.eval(m, :(eval(x) = Core.eval($m, x)))
    # modules created with Module() does not have include defined
    # abspath is needed since this will call `include_relative`
    Core.eval(m, :(include(x) = Base.include($m, abspath(x))))
    # load InteractiveUtils
    Core.eval(m, :(using InteractiveUtils))
    return m
end

sb = sandbox()

callback!(
    app,
    [
        Output("text-resultA", "value"),
        Output("text-resultB", "value"),
        Output("result-common", "children"),
    ],
    Input("button-compare", "n_clicks"),
    [
        State("text-codeA", "value"),
        State("text-codeB", "value"),
        State("text-code-common", "value"),
    ],
) do n_clicks, vA, vB, vCommon
    if isnothing(n_clicks) || n_clicks == 0
        return (nothing, nothing, nothing)
    end

    cCommon = IOCapture.capture(rethrow=Union{}) do
        include_string(sb, vCommon)
    end
    retC = nothing
    if !isnothing(vCommon) && cCommon.error
        retC = """
        $(sprint(showerror, cCommon.value))
        when executing the following code block
        ```julia
        $vCommon
        ```
        """
        @warn "$retC"
    else
        retC = nothing
    end

    cA = IOCapture.capture(rethrow=Union{}) do
        include_string(sb, vA)
    end
    cB = IOCapture.capture(rethrow=Union{}) do
        include_string(sb, vB)
    end

    if cA.error
        retA = """
        $(sprint(showerror, cA.value))
        An error occurs during program execution
        ```julia
        $vA
        ```
        """
    else
        if isempty(cA.output)
            retA = repr(cA.value)
        else
            retA = cA.output
        end
    end

    if cB.error
        retB = """
        $(sprint(showerror, cB.value))
        An error occurs during program execution
        ```julia
        $vB
        ```
        """
    else
        if isempty(cB.output)
            retB = repr(cB.value)
        else
            retB = cB.output
        end
    end

    return (retA, retB, retC)
end

callback!(
    app,
    Output("dummy-resultA", "children"),
    Input("button-copyA", "n_clicks"),
    State("text-resultA", "value"),
) do n_clicks, value
    if !isnothing(n_clicks) && n_clicks > 0
        return clipboard(value)
    end
end

callback!(
    app,
    Output("dummy-resultB", "children"),
    Input("button-copyB", "n_clicks"),
    State("text-resultB", "value"),
) do n_clicks, value
    if !isnothing(n_clicks) && n_clicks > 0
        return clipboard(value)
    end
end

run_server(app, debug=true)
