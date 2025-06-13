{...}: {
  launchd.user.agents.devforums = {
    environment.PYTHONUNBUFFERED = "1";
    script = ''
      cd ~/PycharmProjects/Devforum/
      poetry run python main.py --continue > $(date +%d-%m-%Y).log
    '';
    serviceConfig = {
      StartCalendarInterval = [
        {
          Hour = 6;
          Minute = 0;
        }
      ];
    };
  };
}
