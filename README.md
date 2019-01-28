# Site

The new EMPEX site, now in Elixir!

## Install

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Install Node.js dependencies with `cd assets && yarn install`
- Install Sass/Compass with `gem install compass`

If the css isn't building try `gem uninstall compass sass` and then re-running just `gem install compass`.

## Development

- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Events

To create a new event page:

- Add the template at `lib/site_web/templates/event/#{year}_#{la|nyc}_#{conference|retreat}.html.eex`
- Add a link to `lib/site_web/templates/event/index.html.eex`
- If the event should be highlighted on the homepage:
  - Update `SiteWeb.EventController.[la|nyc]` to link to the new template
  - Potentially switch the order of cards in `lib/site_web/templates/homepage/index.html.eex`

## Talks & Speakers

To add new Talks and Speakers:

Update the talks.csv to include the new talks and associated speaker data. In some places, new speaker data will overwrite older data for the same speaker.

For talks that have multiple speakers, make all speaker fields an array, like so:

```csv
"[""speaker 1 bio"", ""speaker 2 bio""]"
```

It may be helpful to import the CSV into Google Spreadsheets or something to edit it.

The talk will show up in `/talks/:slug`, `/talks`, `/speakers/:speaker_slug`, and `/speakers`
