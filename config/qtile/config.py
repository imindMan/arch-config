
## AUTHOR: imindMan
## Pretty much the default setup because I don't wanna make it so complicated


## Import some libraries
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile import qtile, hook
import os, subprocess

## pre-defined methods
def open_task_manager():
    qtile.cmd_spawn("kitty btop")


## pre-defined constants
MOD = "mod4"
TERMINAL = "kitty"
COLORS = {
        "white": "#C0CAF5",
        "blue": "#7AA2F7",
        "dark": "#33467C",
        "transparency": "#00000000",
        "border_only": "#1A1B26",
        "red": "#F7768E",
        "green": "#73DACA",
        "yellow": "#E0AF68", 
    }

## Key defined
keys = [
    Key([MOD], "a", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "f", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "s", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "d", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([MOD, "shift"], "a", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([MOD, "shift"], "f", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([MOD, "shift"], "s", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "d", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([MOD, "control"], "a", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([MOD, "control"], "f", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([MOD, "control"], "s", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "d", lazy.layout.grow_up(), desc="Grow window up"),
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch TERMINAL"),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD, "shift"], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([MOD], "r", lazy.spawn('rofi -show drun', shell=True)),
    Key([], 'F11', lazy.group['scratchpad'].dropdown_toggle('term')), 
    Key([MOD], "F11", lazy.window.toggle_fullscreen(), desc="Fullscreen Mode"),
    Key([MOD], "w", lazy.window.toggle_minimize(), desc="Minimize Mode"),
    Key([], "XF86AudioMute", lazy.spawn()),
    Key([], "XF86AudioLowerVolume", lazy.spawn()),
    Key([], "XF86AudioRaiseVolume", lazy.spawn()),

]

## Groups defined 
## Kinda good :)))
groups = [Group(i) for i in ["", "", "", "", ""]]
# ScracthPad da king
groups.append(ScratchPad("scratchpad", [DropDown("term", "kitty", x=0.25, y=0.3, width=0.5),]),)
# Define some keys to handle workspaces
key = "12345"
for i in range(len(groups) - 1):
    group = groups[i].name
    keys.extend(
       [
             Key(
                 [MOD],
                 key[i],
                 lazy.group[group].toscreen(),
                 desc="Switch to group {}".format(group),
                 ),
             Key(
                 [MOD, "shift"],
                 key[i],
                 lazy.window.togroup(group, switch_group=True),
                 desc="Switch to & move focused window to group {}".format(groups[i].name),
             ),
         ]
     )


## Layouts defined
layouts = [
    layout.Columns(margin=12, border_width=0),
    layout.Max(),
]

## Bar customization
# Widgets
widget_defaults = dict(
    font="hack nerd font regular",
    fontsize=13,
    padding=4,
    foreground=COLORS["white"]
)

extension_defaults = widget_defaults.copy()
## One screen only
screens = [
    Screen(
        # wallpaper
        wallpaper="~/.config/qtile/backgrounds/background.png",
        wallpaper_mode="fill",
      top=bar.Bar(
         [
              
             #Group widget 
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"],
                 background=COLORS["transparency"]
                 ),
             widget.GroupBox(
                 background=COLORS["blue"], 
                 disable_drag=True
                 ),
             
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"], 
                 background=COLORS["transparency"]
                 ),
             widget.Sep(foreground=COLORS["transparency"]),
              
             #Layout widget
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
             widget.CurrentLayoutIcon(
                 background=COLORS["dark"],
                 ),
             widget.CurrentLayout(
                 background=COLORS["dark"],
                ),
       
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
           widget.Sep(foreground=COLORS["transparency"]),
            #Window display
             widget.Prompt(),
             widget.WindowName(),
             widget.Chord(
                 chords_colors={
                     "launch": (COLORS["dark"], COLORS["dark"]),
                 },
                 name_transform=lambda name: name.upper(),
             ),
              #Sound widget
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"],
                 background=COLORS["transparency"]
                 ),
             widget.Volume(
                     fmt="墳 {}",
                     background=COLORS["blue"],
                     
             ),
             
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"],
                 background=COLORS["transparency"]
                 ),
           widget.Sep(foreground=COLORS["transparency"]),
            #Task manager (btop) widget
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
             widget.TextBox(
                     text="",
                     background=COLORS["dark"],
                     mouse_callbacks={"Button1": open_task_manager}
                 ),
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
           widget.Sep(foreground=COLORS["transparency"]),
            #Network widget
           widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"],
                 background=COLORS["transparency"]
                 ),
             widget.Net(
                     format = " {up} {down}",
                     background=COLORS["blue"]
                 ),
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["blue"],
                 background=COLORS["transparency"]
                 ),
           widget.Sep(foreground=COLORS["transparency"]),

              #Date widget
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
             widget.Clock(format="%a %d-%m-%Y %I:%M %p", 
                          background=COLORS["dark"]),
             widget.TextBox(
                 text="",
                 fontsize=30,
                 padding=0,
                 foreground=COLORS["dark"],
                 background=COLORS["transparency"]
                 ),
         ],
        30,
        margin=10,
        background = COLORS["transparency"],
         #border_width=[2, 0, 2, 0],   #Draw top and bottom borders
         #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    ),
    ),
]

#for floating layout
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]
dgroups_key_binder = None
dgroups_app_rules = []   #type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
         #Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),   #gitk
        Match(wm_class="makebranch"),   #gitk
        Match(wm_class="maketag"),   #gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=0
)

# general settings
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
