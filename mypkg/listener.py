import rclpy     
from rclpy.node import Node      #ノードを実装するためのNodeクラス（クラスは第10回で）
from std_msgs.msg import Int16 #使う型を変更

rclpy.init()
node = Node("listener")

def cb(msg):
    global node
    node.get_logger().info("Listen: %s" % msg.data)

def main():
    pub = node.create_subscription(Int16, "countup", cb, 10)                
    rclpy.spin(node)