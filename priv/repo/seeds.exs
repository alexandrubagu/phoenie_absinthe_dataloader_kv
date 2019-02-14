# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DataloadKv.Repo.insert!(%DataloadKv.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixAbsintheDataloaderKv.Webpage
alias PhoenixAbsintheDataloaderKv.Link

max = %Webpage{
  name: "max.info",
  links: [
    %Link{
      url: "http://www.max.info"
    },
    %Link{
      url: "http://www.max.info/about"
    },
    %Link{
      url: "http://www.max.info/contact"
    },
    %Link{
      url: "http://www.max.info/blog"
    },
    %Link{
      url: "http://www.max.info/portfolio"
    }
  ]
}

joe = %Webpage{
  name: "joe.info",
  links: [
    %Link{
      url: "http://www.joe.info"
    },
    %Link{
      url: "http://www.joe.info/about"
    },
    %Link{
      url: "http://www.joe.info/contact"
    },
    %Link{
      url: "http://www.joe.info/blog"
    },
    %Link{
      url: "http://www.joe.info/portfolio"
    }
  ]
}

PhoenixAbsintheDataloaderKv.Repo.insert!(joe)
PhoenixAbsintheDataloaderKv.Repo.insert!(max)
