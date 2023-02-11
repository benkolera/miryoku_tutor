defmodule TypingTutorWeb.Index do
  use Surface.LiveView

  @word TypingTutor.RandomWord.random_word()

  @media "media"
  @media_colour "text-purple-500"
  @nav "nav"
  @nav_colour "text-cyan-500"
  @mouse "mouse"
  @mouse_colour "text-amber-500"
  @sym "sym"
  @sym_colour "text-green-500"
  @num "num"
  @num_colour "text-blue-500"
  @fun "fn"
  @fun_colour "text-red-500"

  data word_remaining, :string, default: String.slice(@word, 1, String.length(@word))
  data char_to_type, :string, default: String.at(@word, 0)
  data error, :boolean, default: false
  data word_typed, :string, default: ""

  data keymap, :map, default: %{
    left: [
      [
        %{key: "Q",l1_key: "F12", l1_col: @fun_colour, l2_key: "[", l2_col: @num_colour, l3_key: "{", l3_col: @sym_colour},
        %{key: "H",l1_key: "F7", l1_col: @fun_colour, l2_key: "7", l2_col: @num_colour, l3_key: "&", l3_col: @sym_colour},
        %{key: "O",l1_key: "F8", l1_col: @fun_colour, l2_key: "8", l2_col: @num_colour, l3_key: "*", l3_col: @sym_colour},
        %{key: "U",l1_key: "F9", l1_col: @fun_colour, l2_key: "9", l2_col: @num_colour, l3_key: "(", l3_col: @sym_colour},
        %{key: "X",l1_key: "", l1_col: @fun_colour, l2_key: "]", l2_col: @num_colour, l3_key: "}", l3_col: @sym_colour}
      ] ,
      [
        %{key: "Y",held: "ctrl",l1_key: "F11", l1_col: @fun_colour, l2_key: ";", l2_col: @num_colour, l3_key: ":", l3_col: @sym_colour},
        %{key: "I",held: "option",l1_key: "F4", l1_col: @fun_colour, l2_key: "4", l2_col: @num_colour, l3_key: "$", l3_col: @sym_colour},
        %{key: "E",held: "cmd",l1_key: "F5", l1_col: @fun_colour, l2_key: "5", l2_col: @num_colour, l3_key: "%", l3_col: @sym_colour},
        %{key: "A",held: "shift",l1_key: "F6", l1_col: @fun_colour, l2_key: "6", l2_col: @num_colour, l3_key: "^", l3_col: @sym_colour},
        %{key: ".",l1_key: "", l1_col: @fun_colour, l2_key: "=", l2_col: @num_colour, l3_key: "=", l3_col: @sym_colour}
      ],
      [
        %{key: "J",l1_key: "F10", l1_col: @fun_colour, l2_key: "~", l2_col: @num_colour, l3_key: "`", l3_col: @sym_colour},
        %{key: "/",l1_key: "F1", l1_col: @fun_colour, l2_key: "!", l2_col: @num_colour, l3_key: "1", l3_col: @sym_colour},
        %{key: ",",l1_key: "F2", l1_col: @fun_colour, l2_key: "@", l2_col: @num_colour, l3_key: "2", l3_col: @sym_colour},
        %{key: "K",l1_key: "F3", l1_col: @fun_colour, l2_key: "#", l2_col: @num_colour, l3_key: "3", l3_col: @sym_colour},
        %{key: "'",l1_key: "", l1_col: @fun_colour, l2_key: "|", l2_col: @num_colour, l3_key: "\\", l3_col: @sym_colour}
      ] ,
    ],
    left_thumb: [
      %{key: "ESC", held: @media, held_colour: @media_colour,l2_key: ".", l2_col: @num_colour, l3_key: "(", l3_col: @sym_colour },
      %{key: "SPC", held: @nav, held_colour: @nav_colour ,l2_key: "0", l2_col: @num_colour, l3_key: ")", l3_col: @sym_colour },
      %{key: "TAB", held: @mouse, held_colour: @mouse_colour,l2_key: "-", l2_col: @num_colour, l3_key: "_", l3_col: @sym_colour },
    ],
    right: [
      [
        %{key: "G",l1_key: "↪️", l1_col: @mouse_colour, l3_key: "↪", l3_col: @nav_colour},
        %{key: "C",l1_key: "C-p", l1_col: @mouse_colour, l3_key: "C-p", l3_col: @nav_colour},
        %{key: "R",l1_key: "C-c", l1_col: @mouse_colour, l3_key: "C-c", l3_col: @nav_colour},
        %{key: "F",l1_key: "C-x", l1_col: @mouse_colour, l3_key: "C-v", l3_col: @nav_colour},
        %{key: "Z",l1_key: "️⎌", l1_col: @mouse_colour, l3_key: "⎌", l3_col: @nav_colour}
      ],
      [
        %{key: "D",l1_key: "←", l1_col: @mouse_colour, l3_key: "⟸", l3_col: @nav_colour},
        %{key: "S",held: "shift",l1_key: "↓", l1_col: @mouse_colour,l3_key: "⥥", l3_col: @nav_colour},
        %{key: "T",held: "cmd",l1_key: "↑", l1_col: @mouse_colour, l3_key: "⥣", l3_col: @nav_colour},
        %{key: "N",held: "option",l1_key: "→", l1_col: @mouse_colour, l3_key: "➾", l3_col: @nav_colour},
        %{key: "B",held: "ctrl", l1_key: "", l1_col: @mouse_colour, l3_key: "", l3_col: @nav_colour}
      ],
      [
        %{key: "W",l3_key: "hm", l1_col: @mouse_colour, l1_key: "⇇", l3_col: @nav_colour},
        %{key: "M",l3_key: "pdn", l1_col: @mouse_colour, l1_key: "⇊", l3_col: @nav_colour},
        %{key: "L",l3_key: "pup", l1_col: @mouse_colour, l1_key: "⇈", l3_col: @nav_colour},
        %{key: "P",l3_key: "end", l1_col: @mouse_colour, l1_key: "⇉", l3_col: @nav_colour},
        %{key: "V",l3_key: "ins", l1_col: @mouse_colour, l1_key: "", l3_col: @nav_colour}
      ]
    ],
    right_thumb: [
      %{key: "RET", held: @sym, held_colour: @sym_colour,l1_key: "RM", l1_col: @mouse_colour,l3_key: "⏹️", l3_col: @media_colour },
      %{key: "BSP", held: @num, held_colour: @num_colour,l1_key: "LM", l1_col: @mouse_colour,l3_key: "⏯️", l3_col: @media_colour },
      %{key: "DEL", held: @fun, held_colour: @fun_colour,l1_key: "MM", l1_col: @mouse_colour,l3_key: "🔇", l3_col: @media_colour },
    ]
  }

  def handle_event("type", %{"key" => k}, socket) do
    if (k == socket.assigns[:char_to_type]) do
      old_remaining = socket.assigns[:word_remaining]

      if (String.length(old_remaining) == 0) do
        new_word = TypingTutor.RandomWord.random_word()

        {:noreply, assign(socket,
          word_typed: "",
          word_remaining: String.slice(new_word, 1, String.length(new_word)),
          char_to_type: String.at(new_word, 0),
          error: false
        )}
      else
        {:noreply, assign(socket,
          word_typed: socket.assigns[:word_typed] <> k,
          word_remaining: String.slice(old_remaining, 1, String.length(old_remaining)),
          char_to_type: String.at(old_remaining, 0),
          error: false
        )}
      end
    else
      {:noreply, assign(socket, error: true)}
    end

  end

  def handle_event("up", _, socket) do
    {:noreply, assign(socket, error: false)}
  end

end
