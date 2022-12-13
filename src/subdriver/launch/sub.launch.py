__author__ = "Jaeyoung Lim"
__contact__ = "jalim@ethz.ch"

from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os


def generate_launch_description():
    package_dir = get_package_share_directory('subdriver')
    return LaunchDescription([
        Node(
            package='subdriver',
            namespace='subdriver',
            executable='test_control',
            name='control'
        )
    ])