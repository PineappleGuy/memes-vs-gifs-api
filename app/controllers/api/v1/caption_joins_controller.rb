class Api::V1::CaptionJoinsController < ApplicationController
    # skip_before_action :verify_authenticity_token

    def index
        @caption_joins = CaptionJoin.all
        render json: @caption_joins, status: 200
    end

    def create
        # byebug
        caption = Caption.find(params[:caption_id])
        byebug
                if params[:meme_id]
                    captionable = Meme.find(params[:meme_id])
                else
                    captionable = Gif.find(params[:gif_id])
                end
                caption_join = CaptionJoin.find_or_create_by(caption: caption, captionable: captionable)
                     if caption_join.save 
                        render json: {error: false}
                      else
                       render json: {error: true}
                     end
            end

    private
        def caption_join_params
            params.require(:caption_join).permit(:caption_id, :captionable_id, :captionable_type, :meme_id, :gif_id)
        end
end