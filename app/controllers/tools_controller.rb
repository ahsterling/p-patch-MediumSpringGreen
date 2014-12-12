class ToolsController < ApplicationController

  def index
    @available_tools = Tool.order(status: :asc)
    @unavailable_tools = Tool.order(status: :desc)
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(status: params[:status])
      @tool.set_user_id(session[:user_id])
      redirect_to tools_path, notice: "#{@tool.name} successfully checked out!"
    else
      redirect_to tools_path, notice: "#{@tool.name} did not update with status"
    end
  end
end
