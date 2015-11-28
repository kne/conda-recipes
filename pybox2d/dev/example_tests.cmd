REM completely untested as of yet

set examples=apply_force body_types box_cutter breakable bridge bullet cantilever car chain character_collision cloth collision_filtering collision_processing confined convex_hull conveyor_belt distance edge_shapes edge_test empty gish_tribute liquid mobile motor_joint one_sided_platform pinball pulley pyramid raycast restitution rope settings theo_jansen tiles time_of_impact top_down_car tumbler vertical_stack web

python -m examples.hello --backend=pyglet --onlyInit >NUL

(for %%example in (%examples%) do (
    python -m examples.%%example --backend=pyglet --onlyInit
))
