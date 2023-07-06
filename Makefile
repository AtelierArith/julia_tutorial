.phony : all, build, web, test, test-parallel, clean

DOCKER_IMAGE=julia_tutorialjl

all: web

# Excecute in docker container
web: page
	julia --project=slideshow -e 'import Pkg; Pkg.instantiate()'
	julia --project=slideshow slideshow/make.jl
	julia --project=page page/make.jl
	cp -r slideshow/ page/__site/slideshow
	julia --project=slideshow -e 'using LiveServer; serve(dir="page/__site", host="0.0.0.0")'

test: build
	docker-compose run --rm shell julia -e 'using Pkg; Pkg.activate("."); Pkg.test()'

clean:
	docker-compose down
	-find $(CURDIR) -name "*.ipynb" -type f -delete
	-find $(CURDIR) -name "*.html" -type f -delete
	-find $(CURDIR) -name "*.gif" -type f -delete
	-find $(CURDIR) -name "*.ipynb_checkpoints" -type d -exec rm -rf "{}" +
	-rm -f  Manifest.toml docs/Manifest.toml
	-rm -rf docs/build
