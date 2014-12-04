class ToolsController < ApplicationController

  def index
    @available_tools = Tool.where(status: "in")
    @unavailable_tools = Tool.where(status: "out")
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(status: params[:status])
      @tool.set_user_id(session[:user_id])
      redirect_to tools_path, notice: "#{@tool.name} successfully checked out!"
    else
      redirect_to tools_path, notice: "@tool did not update with status"
    end
  end
end
