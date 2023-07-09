using OpenCV
using ImageCore: normedview, colorview, RGB
using ImageInTerminal

# Python のサンプルコードにある cv2 を OpenCV に置換するとそのまま動く
img_bgr = OpenCV.imread("sin.png")
# 忘れがちだが OpenCV では色情報を表すチャンネルが BGR の順番で記録される
img_rgb = OpenCV.cvtColor(img_bgr, OpenCV.COLOR_BGR2RGB)
# Julia のエコシステムが理解できるデータ構造に変換する
jlimg = colorview(RGB, normedview(img_rgb))
# メモリレイアウトの関係上， 空間方向の座標が反転していることに注意. 転置する.
jlimg'