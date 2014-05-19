require_relative '../spec_helper'
require 'redmine_limited_visibility/queries_helper_patch'

describe IssuesController do

  before { @request.session[:user_id] = 1 }

  it 'adds an "authorized viewers filter" to existing requests' do
    q = IssueQuery.create!(name: "new-query", user: User.find(2), visibility: 2, project: nil)
    expect(q.filters).to_not include 'authorized_viewers'
    get :index, query_id: q.id
    response.should be_success
    expect(assigns(:query)).to_not be_nil
    expect(assigns(:query).filters).to include 'authorized_viewers'
  end
end