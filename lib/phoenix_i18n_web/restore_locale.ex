defmodule PhoenixI18nWeb.RestoreLocale do
  import Phoenix.LiveView
  use Phoenix.Component

  def on_mount(:default, _params, _session, socket) do

    {:cont,
     socket
     |> assign(:locale, "en")
     |> attach_hook(:set_locale, :handle_event, &handle_event/3)}
  end

  defp handle_event("toggle_locale", %{"locale" => "en"}, socket) do
    locale = "pt_BR"
    perform_assigns(socket, locale)
  end

  defp handle_event("toggle_locale", %{"locale" => "pt_BR"}, socket) do
    locale = "en"
    perform_assigns(socket, locale)
  end

  defp handle_event(_, _, socket) do
    {:cont, socket}
  end

  defp perform_assigns(socket, locale) do
    Gettext.put_locale(IagocavalcanteWeb.Gettext, locale)
    {:halt, socket |> assign(locale: locale)}
  end
end
