{...}: {
  programs.nixcord = {
    enable = true;

    discord = {
      enable = false;
      openASAR.enable = false;
      vencord.unstable = true;
    };

    vesktop.enable = true;

    config = {
      useQuickCss = true;

      enableReactDevtools = false;

      plugins = {
        accountPanelServerProfile.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        callTimer = {
          enable = true;
          format = "human";
        };
        clearURLs.enable = true;
        consoleJanitor.enable = true;
        dontRoundMyTimestamps.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendInvites.enable = true;
        fullSearchContext.enable = true;
        gifPaste.enable = true;
        hideAttachments.enable = true;
        imageZoom.enable = true;
        implicitRelationships = {
          enable = true;
          sortByAffinity = true;
        };
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLatency.enable = true;
        messageLinkEmbeds = {
          enable = true;
          automodEmbeds = "always";
        };
        messageLogger = {
          enable = true;
          deleteStyle = "overlay";
          collapseDeleted = true;
          logEdits = false;
          ignoreBots = true;
          ignoreSelf = true;
        };
        moreUserTags = {
          enable = true;
          dontShowForBots = true;
        };
        newGuildSettings = {
          enable = true;
          everyone = false;
          role = false;
          events = false;
        };
        noBlockedMessages.enable = true;
        noF1.enable = true;
        noUnblockToJump.enable = true;
        reactErrorDecoder.enable = true;
        relationshipNotifier.enable = true;
        summaries.enable = true;
        shikiCodeblocks.enable = true;
        showHiddenThings.enable = true;
        translate.enable = true;
        typingTweaks.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceChatDoubleClick.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };

    quickCss = builtins.readFile ./Acorn.css;
  };
}
