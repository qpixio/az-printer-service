module.exports = {
    apps: [{
      name: "print-server",
      script: "./print-server.js",
      watch: true,
      env: {
        NODE_ENV: "production",
      },
      // Restart if memory exceeds 100MB
      max_memory_restart: '100M',
      // Restart on crash
      autorestart: true,
      // Restart delay
      restart_delay: 4000
    }]
  }