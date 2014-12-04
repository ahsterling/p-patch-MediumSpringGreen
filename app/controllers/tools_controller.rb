class ToolsController < ApplicationController

  def index
    @available_tools = Tool.where(status: "in")
    @unavailable_tools = Tool.where(status: "out")
  end
end
