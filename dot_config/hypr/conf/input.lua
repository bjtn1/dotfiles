-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout = "us",
    kb_options = "caps:escape",
    follow_mouse = 1,
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    touchpad = {
      natural_scroll = false,
    },
  },
})

-- Note: gestures { workspace_swipe = false } from the old config has no direct
-- equivalent -- workspace_swipe/_fingers/_min_fingers were removed in favor of the
-- new opt-in hl.gesture() system. It was already disabled, so omitting any
-- hl.gesture() workspace-swipe rule here reproduces the same (disabled) behavior.

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({ name = "epic-mouse-v1", sensitivity = 1 })
