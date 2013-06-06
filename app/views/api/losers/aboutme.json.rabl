object @loser
attributes :id, :username, :email
child(:credit) { extends "api/credits/show" }