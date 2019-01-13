class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :photo, only: [:destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
     # notify_subscribers_new_photo(@event, @new_photo)

      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    if current_user_can_edit?(@photo)
      @foto.destroy
    else
      message = {alert: I18n.t('controllers.photos.error')}
    end

    redirect_to @event, message
  end

  private
    def set_photo
      @photo = @event.photos.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def photo_params
      params.fetch(:photo, {}).permit(:photo)
    end

    def notify_subscribers_new_photo(event, photo)
      all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [current_user.email]

      all_emails.each do |mail|
        EventMailer.photo(event, photo, mail).deliver_now
      end
    end
end
