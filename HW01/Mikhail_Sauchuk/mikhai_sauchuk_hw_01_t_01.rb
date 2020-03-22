# this script calculate the angle between the clock's hands

ONE_MIN_ANGLE = 360 / 60
ONE_OUR_ANGLE = ONE_MIN_ANGLE * 5

def calc_angle
    print "Please, input hours "
    hours = get_input
    print "Now, please input minutes "
    minutes = get_input
    angle = (minutes * ONE_MIN_ANGLE - (hours * ONE_OUR_ANGLE + minutes / 2)).abs
    puts ("The angel between hours hand #{hours} and minutes #{minutes} is #{angle}")
end

def get_input
    return gets.to_f
end

calc_angle