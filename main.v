module main

import lib.lex
import cli { Command, Flag }
import os

fn main() {
	mut cmd := Command {
		name: "garbanzo"
		description: "Simple file setup tool."
		version: "0.0.0"
	}

	cmd.add_flag( Flag {
		flag: .string
		name: "file"
		description: "Input file path"
		required: false
	})

	cmd.add_flag( Flag {
		flag: .string
		name: "string"
		description: "Raw string input"
		required: false
	})

	cmd.parse(os.args)
	mut file := cmd.flags.get_string("file") or {""}

	println("${file}")
}
