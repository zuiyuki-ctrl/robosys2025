import rclpy     
from rclpy.node import Node      #ノードを実装するためのNodeクラス（クラスは第10回で）
# from person_msgs.srv import Query #使う型を変更
# rclpy.init()
# node = Node("talker")

# def cb(request, response):
#     if request.name == "Tom":
#         response.age = 46
#     else:
#         response.age = 255

#     return response


# def main():
#     srv = node.create_service(Query, "query", cb) #サービスの作成                     
#     rclpy.spin(node)

from std_msgs.msg import Int16   #通信の型（16ビットの符号付き整数）

rclpy.init() 
node = Node("talker")            #ノード作成（nodeという「オブジェクト」を作成）
pub = node.create_publisher(Int16, "countup", 10)   #パブリッシャのオブジェクト作成
n = 0 #カウント用変数

def cb():
    global n
    msg = Int16()
    msg.data = n           #msgファイルに書いた「age」                             
    pub.publish(msg)
    n += 1

def main():
    node.create_timer(0.5, cb)  #タイマー設定
    rclpy.spin(node)            #実行（無限ループ）