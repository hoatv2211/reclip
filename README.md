# ReClip

> ⚠️ This is a fork of [averygan/reclip](https://github.com/averygan/reclip) with cloud deployment support (Railway, Vercel, etc.)

A self-hosted, open-source video and audio downloader with a clean web UI. Paste links from YouTube, TikTok, Instagram, Twitter/X, and 1000+ other sites — download as MP4 or MP3.

![Python](https://img.shields.io/badge/python-3.8+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## Features

- Download videos from 1000+ supported sites (via [yt-dlp](https://github.com/yt-dlp/yt-dlp))
- MP4 video or MP3 audio extraction
- Quality/resolution picker
- Bulk downloads — paste multiple URLs at once
- Automatic URL deduplication
- Clean, responsive UI — no frameworks, no build step
- Single Python file backend (~150 lines)
- **Deploy anywhere**: Railway, Render, VPS, or local

## Quick Start

### Local Installation

#### Windows

```bash
# Double-click to run
run.bat
```

Or manually:
```bash
# Install prerequisites
pip install flask yt-dlp
python app.py
```

#### macOS / Linux

```bash
# Install prerequisites
brew install yt-dlp ffmpeg    # macOS
# or: sudo apt install ffmpeg && pip install yt-dlp

# Run
./reclip.sh
```

Open **http://localhost:8899**.

### Docker

```bash
docker build -t reclip . && docker run -p 8899:8899 reclip
```

### Cloud Deployment (Railway)

1. Push your fork to GitHub
2. Go to [Railway.app](https://railway.app)
3. Create new project → Deploy from GitHub repo
4. Set environment variables:
   - `PORT=8080`
   - `HOST=0.0.0.0`
5. Deploy!

Your app will be available at `https://your-project.up.railway.app`

## Usage

1. Paste one or more video URLs into the input box
2. Choose **MP4** (video) or **MP3** (audio)
3. Click **Fetch** to load video info and thumbnails
4. Select quality/resolution if available
5. Click **Download** on individual videos, or **Download All**

## Supported Sites

Anything [yt-dlp supports](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md), including:

YouTube, TikTok, Instagram, Twitter/X, Reddit, Facebook, Vimeo, Twitch, Dailymotion, SoundCloud, Loom, Streamable, Pinterest, Tumblr, Threads, LinkedIn, and many more.

## Stack

- **Backend:** Python + Flask (~150 lines)
- **Frontend:** Vanilla HTML/CSS/JS (single file, no build step)
- **Download engine:** [yt-dlp](https://github.com/yt-dlp/yt-dlp) + [ffmpeg](https://ffmpeg.org/)
- **Dependencies:** 2 (Flask, yt-dlp)

## Project Structure

```
reclip/
├── app.py              # Flask backend API
├── public/
│   └── index.html      # Frontend UI
├── run.bat             # Windows launcher
├── reclip.sh           # macOS/Linux launcher
├── requirements.txt    # Python dependencies
├── .railway/
│   └── railway.json    # Railway deployment config
└── nixpacks.toml       # Nixpacks build config
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/info` | POST | Get video info (title, thumbnail, formats) |
| `/api/download` | POST | Start download job |
| `/api/status/<job_id>` | GET | Check download status |
| `/api/file/<job_id>` | GET | Download completed file |

## Disclaimer

This tool is intended for personal use only. Please respect copyright laws and the terms of service of the platforms you download from. The developers are not responsible for any misuse of this tool.

## License

[MIT](LICENSE)
