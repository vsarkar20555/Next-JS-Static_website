module.exports = {
  apps: [
    {
      name: "nextjs",

      script: "node_modules/next/dist/bin/next",

      args: "start -H 127.0.0.1 -p 3000",

      instances: 2,

      exec_mode: "cluster",

      listen_timeout: 90000,

      kill_timeout: 10000,

      autorestart: true,

      env: {
        NODE_ENV: "production",
      },
    },
  ],
};
