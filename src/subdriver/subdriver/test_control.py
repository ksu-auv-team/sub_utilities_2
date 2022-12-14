import rclpy
import numpy as np
from rclpy.node import Node
from rclpy.clock import Clock
from rclpy.qos import QoSProfile, QoSReliabilityPolicy, QoSHistoryPolicy, QoSDurabilityPolicy

from px4_msgs.msg import OffboardControlMode
from px4_msgs.msg import TrajectorySetpoint
from px4_msgs.msg import VehicleStatus


class TestControl(Node):

    def __init__(self):
        super().__init__('minimal_publisher')
        qos_profile = QoSProfile(
            reliability=QoSReliabilityPolicy.RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT,
            durability=QoSDurabilityPolicy.RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL,
            history=QoSHistoryPolicy.RMW_QOS_POLICY_HISTORY_KEEP_LAST,
            depth=1
        )

        self.status_sub = self.create_subscription(
            VehicleStatus,
            '/fmu/out/vehicle_status',
            self.vehicle_status_callback,
            qos_profile)
        self.publisher_offboard_mode = self.create_publisher(OffboardControlMode, '/fmu/in/offboard_control_mode', qos_profile)
        self.publisher_trajectory = self.create_publisher(TrajectorySetpoint, '/fmu/in/trajectory_setpoint', qos_profile)
        timer_period = 5  # seconds
        self.timer = self.create_timer(timer_period, self.cmdloop_callback)

        self.nav_state = VehicleStatus.NAVIGATION_STATE_MAX
        self.dt = timer_period
        self.theta = 0.0
        self.radius = 5.0
        self.omega = 0.5
 
    def vehicle_status_callback(self, msg):
        # TODO: handle NED->ENU transformation
        print("NAV_STATUS: ", msg.nav_state)
        print("  - offboard status: ", VehicleStatus.NAVIGATION_STATE_OFFBOARD)
        self.nav_state = msg.nav_state

    def cmdloop_callback(self):
        while(True):
            # Publish offboard control modes
            offboard_msg = OffboardControlMode()
            offboard_msg.timestamp = int(Clock().now().nanoseconds / 1000)
            offboard_msg.position=False
            offboard_msg.velocity=True
            offboard_msg.acceleration=False
            self.publisher_offboard_mode.publish(offboard_msg)
            if self.nav_state == VehicleStatus.NAVIGATION_STATE_OFFBOARD:

                trajectory_msg = TrajectorySetpoint()
                trajectory_msg.velocity[0] = 10
                trajectory_msg.velocity[1] = 0
                trajectory_msg.velocity[2] = 0
                trajectory_msg.yaw = 3.14 * 0.8
                self.publisher_trajectory.publish(trajectory_msg)

                self.theta = self.theta + self.omega * self.dt


def main(args=None):
    rclpy.init(args=args)

    test_control = TestControl()

    rclpy.spin(test_control)

    test_control.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
