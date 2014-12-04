class ToolsController < ApplicationController

  def index
    @available_tools = Tool.where(status: "in")
    @unavailable_tools = Tool.where(status: "out")
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(status: "out", user_id: session[:user_id])
      redirect_to tools_path
    end
  end
end
