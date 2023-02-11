defmodule TypingTutorWeb.Key do
  use Surface.Component

  prop key, :string, required: true
  prop char_to_type, :string, required: true
  prop held, :string, required: false
  prop held_colour, :string, default: "text-stone-600"
  prop l1_key, :string, default: ""
  prop l1_col, :string, default: "text-black"
  prop l2_key, :string, default: ""
  prop l2_col, :string, default: "text-black"
  prop l3_key, :string, default: ""
  prop l3_col, :string, default: "text-black"

  def render(assigns) do
    to_press = String.downcase(assigns[:key]) == String.downcase(assigns[:char_to_type])

    ~F"""
      <div class={"grid","grid-rows-3","grid-cols-3","rounded","shadow-lg","gap-1","text-center","bg-slate-200": !to_press, "bg-sky-300": to_press}>
        <div class="w-8 h-8"><span class={@l1_col}>{@l1_key}</span></div>
        <div class="w-8 h-8"><span class={@l2_col}>{@l2_key}</span></div>
        <div class="w-8 h-8"><span class={@l3_col}>{@l3_key}</span></div>
        <div class="col-span-3"><span class={"text-black": !to_press, "text-blue-800": to_press}>{@key}</span></div>
        <div class="col-span-3"><span class={@held_colour}>{@held}</span></div>
      </div>
    """
  end

end
