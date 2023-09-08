      const provider = new ethers.providers.Web3Provider(
        window.ethereum,
        "goerli"
      );
      const MoodContractAddress = "0xC2dD28A6B226D684bE093F510991A2dC664C50d0";
      const MoodContractABI = [
        {
          inputs: [
            {
              internalType: "string",
              name: "_mood",
              type: "string",
            },
          ],
          name: "setMood",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [],
          name: "getMood",
          outputs: [
            {
              internalType: "string",
              name: "",
              type: "string",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
      ];
      let MoodContract;
      let signer;
      provider.send("eth_requestAccounts", []).then(() => {
        provider.listAccounts().then((accounts) => {
          signer = provider.getSigner(accounts[0]);
          MoodContract = new ethers.Contract(
            MoodContractAddress,
            MoodContractABI,
            signer
          );
        });
      });
