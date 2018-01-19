somma_numeri(String, Somma) :-
  atom_chars(String, Chars),
  phrase(parse_numbers(List), Chars),
  somma(List, Somma).

parse_numbers(List) -->
  whitespace,
  parse_values(List),
  !,
  whitespace.

parse_values([Current|Next]) -->
  parse_number(Current),
  whitespace,
  parse_values(Next).

parse_values([Value]) -->
  parse_number(Value).

whitespace -->
  whitespace_char,
  !,
  whitespace.

whitespace --> [].

% Check if a char is a space
whitespace_char -->
  [Char],
  { char_type(Char, space) }.

parse_number(Value) -->
  parse_number_atom(Value),
  !.

% Parse number
parse_number_atom(Value) -->
  parse_digits(Digits),
  {
      atomic_list_concat(Digits, Atom),
      atom_number(Atom, Value)
  }.

parse_digits([Digit|Digits]) -->
  parse_digit(Digit),
  !,
  parse_digits(Digits).

parse_digits([]) --> [].

% A number is made by valid digits checked using valid_digit
parse_digit(Digit) -->
  [Digit],
  { valid_digit(Digit) }.

% A valid digit is made by 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
valid_digit(Digit) :-
  member(Digit, ['0','1','2','3','4','5','6','7','8','9','0','.']).


somma([], 0) :- !.

somma([X | Xs], Res) :-
  somma(Xs, Phase),
  Res is Phase + X.