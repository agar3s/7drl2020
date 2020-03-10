extends Node

signal COMMAND_ENTERED(raw_command, command, params)

# general signals
signal ACTION_CALLED(action_name, params)

# character signals
signal ORDER_MOVE(direction)
