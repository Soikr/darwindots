{...}: {
  programs.nixcord = {
    enable = true;

    discord = {
      enable = true;
      openASAR.enable = true;
      vencord.unstable = true;
    };

    config = {
      useQuickCss = false;

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
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendInvites.enable = true;
        fullSearchContext.enable = true;
        gifPaste.enable = true;
        hideAttachments.enable = true;
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
        relationshipNotifier.enable = true;
        summaries.enable = true;
        shikiCodeblocks.enable = true;
        showHiddenThings.enable = true;
        translate.enable = true;
        typingTweaks.enable = true;
        voiceChatDoubleClick.enable = true;
        whoReacted.enable = true;
      };
    };

    #quickCss = builtins.readFile ./Acorn.css;
  };
}
