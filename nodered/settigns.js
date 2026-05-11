module.exports = {
  adminAuth: {
    type: "credentials",
    users: [
      {
        username: "admin",
        password:
          "$2b$08$M9l9Q1Qe6jN6fXh5kK6Vnuh0eQ5X2G6r9e3mFf4wI2XjYQ7fN8vP2",
        permissions: "*",
      },
    ],
  },

  uiPort: process.env.PORT || 1880,

  mqttReconnectTime: 15000,

  serialReconnectTime: 15000,

  debugMaxLength: 1000,

  flowFile: "flows.json",

  credentialSecret: "iotstacksecret",

  functionGlobalContext: {},
};
