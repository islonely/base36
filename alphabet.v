module base36

const(
	alphabets = {
		'upper':				new_alphabet('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ')
		'lower':				new_alphabet('0123456789abcdefghijklmnopqrstuvwxyz')
		'alternating-case':		new_alphabet('AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRr')
	}
)

struct Alphabet {
mut:
	decode []i8 = []i8{len: 128}
	encode []byte = []byte{len: 36}
}

pub fn (alphabet &Alphabet) str() string {
	mut str := []byte{}
	for entry in alphabet.encode {
		str << entry
	}
	return str.bytestr()
}

pub fn new_alphabet(str string) &Alphabet {
	if str.len != 36 {
		panic('base36 > new_alphabet(string): string must be 58 characters in length')
	}

	mut ret := &Alphabet{}
	copy(ret.encode, str.bytes())
	for i, _ in ret.decode {
		ret.decode[i] = -1
	}

	mut distinct := 0
	for i, b in ret.encode {
		if ret.decode[b] == -1 {
			distinct++
		}
		ret.decode[b] = i8(i)
	}

	if distinct != 36 {
		panic('base36 > new_alphabet(string): string must not contain repeating characters')
	}

	return ret
}