class ClipController < ApplicationController

  def create
    id = Clip.create(request.body.read)
    render status: 201, json: {id: id}
  end

  def show
    content = Clip.get(params['id'])

    if content
      render status: 200, text: content
    else
      render status: 404, text: "clip #{params['id']} not found"
    end
  end

end
