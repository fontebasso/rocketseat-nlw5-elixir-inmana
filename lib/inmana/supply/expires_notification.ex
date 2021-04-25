defmodule Inmana.Supply.ExpiresNotification do
  alias Inmana.Mailer
  alias Inmana.Supply.{ExpiresEmail, GetByExpires}

  def send do
    data = GetByExpires.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpiresEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
