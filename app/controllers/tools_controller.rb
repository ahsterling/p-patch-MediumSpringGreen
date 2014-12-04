class ToolsController < ApplicationController

  def index
    @available_tools = Tool.where(status: "in")
    @unavailable_tools = Tool.where(status: "out")
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.status = "out"
    @tool.save
    redirect_to tools_path

  end
end
