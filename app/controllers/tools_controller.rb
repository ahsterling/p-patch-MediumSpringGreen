class ToolsController < ApplicationController

  def index
    @available_tools = Tool.where(status: "in")
    @unavailable_tools = Tool.where(status: "out")
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(status: params[:status])
      if @tool.status == "out"
        @tool.update(user_id: session[:user_id])
      elsif @tool.status == "in"
        @tool.update(user_id: nil)
      end
      redirect_to tools_path
    end
  end
end
