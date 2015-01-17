defmodule HtmlStructureTest do
  use ExUnit.Case

  test "doctype" do
    source = """
    doctype
    """
    expected = "<!DOCTYPE html>"
    assert expected == Slim.render(source)
  end

  test "doctype 5" do
    source = """
    doctype 5
    """
    expected = "<!DOCTYPE html>"
    assert expected == Slim.render(source)
  end

  test "doctype html" do
    source = """
    doctype html
    """
    expected = "<!DOCTYPE html>"
    assert expected == Slim.render(source)
  end

  test "doctype strict" do
    source = """
    doctype strict
    """
    expected = ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">)
    assert expected == Slim.render(source)
  end

  test "doctype frameset" do
    source = """
    doctype frameset
    """
    expected = ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">)
    assert expected == Slim.render(source)
  end

  test "doctype transitional" do
    source = """
    doctype transitional
    """
    expected = ~S(<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">)
    assert expected == Slim.render(source)
  end
end
