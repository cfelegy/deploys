# Deployment Scripts
A set of scripts maintained to make it easier to bring projects online.

## Directory
- `aspnet` -- deployment scripts for an ASP.Net Core website running under
Alpine, behind an nginx reverse-proxy. Complete with LetsEncrypt support out of
box. Assumes the application is backed with PostgreSQL.
- `ops` -- daily operations scripts, currently contains an automated database
backup. Backups are offshored to an Azure blob container for safekeeping.

## Why Alpine?
Alpine is cost-effective. Applications built with .NET Core seem to like a few
hundred megabytes to themselves, and don't leave much breathing room on a basic
512MB VPS. The standard Ubuntu images offered by most VPS hosts come with some
cruft already installed, and a fresh Alpine install comes with near nothing.

## Why not Docker?
Deploying an app with a Dockerfile is definitely easier, but this comes with the
assumption that I have a stable target to deploy to. For contract projects, the
end deployment is running under some other organization's resources with their
own billing. In this case, it is more preferable to spin up a cheap VPS for the
duration of the project, deploy my app, and transfer ownership away; as opposed
to renting a server capable of running a heavier workload (multiple Docker/Kubes
instances) and maintaining that server for the total duration of all the projects
I have ever developed.

Services like https://fly.io/ are certainly an easier option, but have yet to
prove longevity or billing stability. For personal/hobby projects I would be
more likely to use this, but for a project that needs several years of uptime,
I still feel that it is more reliable to let the project remain isolated to its
own VPS.

## Attribution
My deployment script is modeled heavily after Drew Devault's
[new server checklist](https://drewdevault.com/new-server), including the direct
usage with modification of some configuration files (acme, nginx) which is used fairly and attributed under [CC-BY-SA](https://creativecommons.org/licenses/by-sa/2.0/).