defmodule PhoenixI18nWeb.ToggleLocale do
  use Phoenix.Component

  def toggle_locale(assigns) do
    ~H"""
    <button
      phx-click="toggle_locale"
      phx-value-locale={@locale}
      type="button"
      aria-label="Toggle locale"
      class="group rounded-full bg-white/90 px-3 py-2 shadow-lg shadow-zinc-800/5 ring-1 ring-zinc-900/5 backdrop-blur transition dark:bg-zinc-800/90 dark:ring-white/10 dark:hover:ring-white/20"
    >
      <img
        src={"/images/flags/#{@locale}.png"}
        class="h-6 w-6 fill-zinc-700 stroke-zinc-500 transition dark:fill-teal-400/10 dark:stroke-teal-500"
      />
    </button>
    """
  end
end
