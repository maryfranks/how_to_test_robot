require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'
require 'pry'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true
    assert_equal(1, robot.station)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    assert_equal(2, robot.station)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    robot = Robot.new
    robot.needs_repairs = true
    assert_equal(3, robot.station)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    robot = Robot.new
    assert_equal(4, robot.station)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    robot = Robot.new
    assert_equal(-1, robot.prioritize_tasks)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    robot = Robot.new
    robot.todos = [4, 8, 9, 11]
    assert_equal(11, robot.prioritize_tasks)
  end

  def test_workday_on_day_off_returns_false
    robot = Robot.new
    robot.day_off = "Tuesday"
    result = robot.workday?("Tuesday")
    assert_equal(false, result)
  end

  def test_workday_not_day_off_returns_true
    robot = Robot.new
    robot.day_off = "Monday"
    result = robot.workday?("Tuesday")
    assert_equal(true, result)
  end

end
