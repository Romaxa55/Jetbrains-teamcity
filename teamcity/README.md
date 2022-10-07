# TeamCity docker-compose multi-node sample [![JetBrains team project](http://jb.gg/badges/team.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

## To start

    docker-compose up

Next, open http://localhost:8111 for the initial setup.

After creating a user, visit ["Agents -> Unauthorized"](http://localhost:8111/agents.html?tab=unauthorizedAgents) to authorize the build agent.

See http://localhost:8111/admin/admin.html?item=nodesConfiguration for nodes configuration.

## To shutdown

    docker-compose down

