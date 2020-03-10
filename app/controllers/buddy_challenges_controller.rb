class BuddyChallengesController < ApplicationController
  def index
    @received = current_user.received_challenges
    @sent = current_user.sent_challenges
    @sent_status = request_status(@sent)
  end


  def create
    @buddy_challenge = BuddyChallenge.new(receiver_id: params[:buddy_challenge][:receiver_id], sender_id: current_user.id, challenge_id: params[:challenge_id], status: false)
    @buddy_challenge.save
    redirect_to buddy_challenges_path
  end

  def update
    @buddy_challenge = BuddyChallenge.find(params[:id])
    @buddy_challenge.update(status: true)
    ChallengeSubscription.create(user: @buddy_challenge.sender, challenge: @buddy_challenge.challenge)
    ChallengeSubscription.create(user: @buddy_challenge.receiver, challenge: @buddy_challenge.challenge)
    redirect_to buddy_challenges_path
  end

  def destroy
    @buddy_challenge = BuddyChallenge.find(params[:id])
    @buddy_challenge.destroy
    redirect_to buddy_challenges_path
  end


  private

  def request_status(sent)
    sent.each do |r|
      if r.status == true
        return 'Accepted'
      else
        return 'Pending'
      end
    end
  end
end
