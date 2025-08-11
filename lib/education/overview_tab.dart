import 'package:flutter/material.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Overview',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Violence against women is a widespread and deeply rooted issue that takes '
              'many forms — physical abuse, emotional and psychological manipulation, '
              'sexual harassment or assault, economic deprivation, and online abuse. '
              'These acts of violence can occur in homes, workplaces, public spaces, and even '
              'within digital environments. The effects are not only physical but also leave '
              'lasting emotional scars, erode self-confidence, and impact entire families and communities.\n\n'
              'Understanding the different forms of violence is the first step towards prevention. '
              'Physical violence may include hitting, slapping, or any form of bodily harm. '
              'Emotional abuse involves humiliation, intimidation, or controlling behavior. '
              'Sexual violence includes any non-consensual sexual act, while economic abuse restricts a '
              'person’s ability to acquire, use, or maintain financial resources. In the digital age, '
              'online harassment — such as cyberstalking, non-consensual sharing of images, or threatening messages — '
              'has become increasingly common.\n\n'
              'Empowerment is a powerful tool in combating violence. It means giving women the knowledge, '
              'skills, and confidence to stand up for their rights, seek help when needed, and build safe, fulfilling lives. '
              'Empowerment also involves creating strong support systems: friends, family members, legal advisors, counselors, '
              'and community organizations that can provide protection and guidance.\n\n'
              'Education plays a key role in prevention. By teaching young people about gender equality, respect, and consent, '
              'we can address harmful attitudes before they turn into harmful behaviors. Public awareness campaigns, community workshops, '
              'and accessible helplines help ensure that women know their rights and the resources available to them.\n\n'
              'Technology, when used responsibly, can also be an ally. Safety apps, GPS tracking, and emergency hotlines allow women to call '
              'for help instantly. However, it is equally important to safeguard personal information to prevent misuse.\n\n'
              'In the fight against gender-based violence, unity is essential. Communities must speak out against abuse, support survivors, '
              'and hold perpetrators accountable. Legal systems must be responsive, fair, and survivor-centered. Healthcare providers should '
              'offer trauma-informed care, and workplaces must implement zero-tolerance policies for harassment.\n\n'
              'Change takes time, but it begins with each of us. Whether by listening to survivors, challenging harmful stereotypes, '
              'educating others, or volunteering with local organizations, we all have a role to play. Together, we can create a safer, '
              'more equitable society where every woman and girl can live without fear and reach her full potential.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
