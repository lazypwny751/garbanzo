module main

// import lib.lex
import os

fn main() {
	args := os.args[1..]
	if args.len == 0  {
		die(Die{ 
			msg: "Insufficient parameter." 
		})
	}

	mut ne := []string{}
	for f in args {
		if ! os.exists(f) {
			ne << f
		}
	}

	if ne.len != 0 {
		die(Die{
			msg: "File not found: ${ne.join(', ')}"
		})
	}

	for path in args {
		mut cfg := new_cfg(path)
		println("path: ${cfg.path}\nbase: ${cfg.base}\ndir:  ${cfg.dir}")
	}
}

struct Cfg {
	path string
	base string
	dir  string
}

fn new_cfg(path string) Cfg {
	return Cfg {
		path: path
		base: os.base(path)
		dir:  os.dir(path)
	}
}

struct Die {
	msg    string = "Unknown error."
	status int    = 1 
}

fn die(cfg Die) {
    eprintln(cfg.msg)
    exit(cfg.status)
}