defmodule Elix.Responders.GifMeTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "elix", responders: [{Elix.Responders.GifMe, []}]
  test "gif me - responds with a GIF url", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "gif me steve"}}
    assert_receive {:message, %{text: text}}
    assert String.ends_with?(text, "http://test-gif-url.gif")
  end
end
