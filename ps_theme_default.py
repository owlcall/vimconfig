class DefaultColor:
    """
    This class should have the default colors for every segment.
    Please test every new segment with this theme first.
    """
    # RESET is not a real color code. It is used as in indicator
    # within the code that any foreground / background color should
    # be cleared
    RESET = -1

    USERNAME_FG = 250      # White
    USERNAME_BG = 240      # Grey
    USERNAME_ROOT_BG = 124 # Red (medium)

    HOSTNAME_FG = 250    # White
    HOSTNAME_BG = 238    # Grey

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 31         # Teal (pale)
    HOME_FG = 255        # White
    PATH_BG = 237        # Grey (dark)
    PATH_FG = 250        # Grey (pre-bright)
    CWD_FG = 254         # White
    SEPARATOR_FG = 244   # Grey (pre-bright)

    READONLY_BG = 124    # Red (medium)
    READONLY_FG = 254    # White

    SSH_BG = 166         # Orange (almost brightest)
    SSH_FG = 254         # White

    REPO_CLEAN_BG = 148  # Pale green
    REPO_CLEAN_FG = 0    # Black
    REPO_DIRTY_BG = 161  # Pink (red)
    REPO_DIRTY_FG = 121  # Teal (bright)

    JOBS_BG = 238        # Grey (medium)
    JOBS_FG = 39         # Blue (sky)

    CMD_PASSED_BG = 236  # Grey (dark)
    CMD_PASSED_FG = 34   # Green (light)
    CMD_FAILED_BG = 236  # Grey (dark)
    CMD_FAILED_FG = 160  # Red (bright)

    SVN_CHANGES_BG = 148 # Yellow (pale)
    SVN_CHANGES_FG = 22  # Green (dark)

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 255
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 17
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

    VIRTUAL_ENV_BG = 35  # a mid-tone green
    VIRTUAL_ENV_FG = 00

class Color(DefaultColor):
    """
    This subclass is required when the user chooses to use 'default' theme.
    Because the segments require a 'Color' class for every theme.
    """
    pass
