# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def open_modal
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append('modal', partial: 'pages/modal_content') }
    end
  end

  def close_modal
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.close('modal') }
    end
  end
end