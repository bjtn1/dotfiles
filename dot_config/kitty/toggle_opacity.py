import os
from kittens.tui.handler import result_handler

def main(args):
    pass

@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss):
    state_file = f'/tmp/kitty_opacity_{target_window_id}'
    if os.path.exists(state_file):
        boss.call_remote_control(boss.active_window, ('set-background-opacity', '1.0'))
        os.unlink(state_file)
    else:
        boss.call_remote_control(boss.active_window, ('set-background-opacity', '0.0'))
        open(state_file, 'w').close()
