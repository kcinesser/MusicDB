# frozen_string_literal: true

class ResourceNotesController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @resource_note = @resource.resource_notes.create(resource_note_params)
    redirect_to resource_path(@resource)
  end

  def destroy
    @resource = Resource.find(params[:resource_id])
    @resource_note = @resource.resource_notes.find(params[:id])
    @resource_note.destroy
    redirect_to resource_path(@resource)
  end

  private

  def resource_note_params
    params.require(:resource_note).permit(:body)
  end
end
