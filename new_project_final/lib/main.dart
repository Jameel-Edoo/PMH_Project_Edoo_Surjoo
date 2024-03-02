import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

// ignore: use_key_in_widget_constructors
class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 222, 219),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.whatshot, // WhatsApp icon
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to UDM Connect!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            // You can add your logo or any other widgets here
            // For now, let's navigate to the ChatList when the icon is pressed
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTabsScreen()),
                );
              },
              child: const Text('Open WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyTabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green, // Set the background color to green
          title: const Text('My WhatsApp'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.perm_contact_calendar)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatList(),
            StatusTab(),
            const CallsTab(),
          ],
        ),
      ),
    );
  }
}

// Rest of the code (StatusTab, CallsTab, etc.) remains unchanged.


class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile Pic - Replace with your profile image logic
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAnwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAQIDBAYHAP/EADsQAAIBAwIDBQUHAwMFAQAAAAECAwAEEQUhEjFBBhMiUWEUMkJxgQeRobHB0fAjUuEVYnIzQ4KywiT/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBQT/xAAdEQEBAQEAAwEBAQAAAAAAAAAAARECAxIhMUEy/9oADAMBAAIRAxEAPwDplOHSkoX2j1qPRbEvs1zKOGGM9T5n0FSSPtJ2hi0eIRxgS3sg8CZ2X1b0/OueH2vVr9mbNxdyeJmYkKi+beQ8h1p0EV1q17JljJNI3HLM2/B6/sPTyrVWNpDZQCKBcDJJYnJc9ST1NTauRW07SoLDx/8AVuCMNMw3+SjoKvnlXjSZqDIaQ0pphNALmmk16kNBFr2abmkzQD80mabmkzQEma8Kj4hXuMUBX1CwjvQWB7ucDwyAfgR1FBFa5sLoZLRXCbqwOxHmD1BrRGVRVW9jhu4uB9mByj9VNPSrV9m9ej1eDgfC3SDxIOvqKN1yC2nuNPvBJG3BPCc7cj/g107RNVh1awS4jBDDwyRjcq3lVwqkubmK0tpbic4jjUsx9K5bqN3c63qZl4cyyngijJ8Ma/oBzP8AmtF271PiddOjbCxgSTnO2cbD9frVPs9YiGE3kgImmHhzzVOg+Z5n6eVK05BDTrGKwt+5j3OeJ5DzdvM/zarVIKWoUSkNLTedAIaYap6prOm6UnFf3kUOfhJyx+g3rK332j6dGStlazznoz+AfvTylbG0PKmk4rmc/wBo+oMx7izto16cRZjVR+32sH3Gts+Rh/zT9aWup8VeLVy9O3urIoaSK0fPThI/Wr9r9oe4F3Y4HVo3/Q0elGt8XpDJQDTe1OlakVWK47uQ/BKOE0YzU2YepDIaYZKYTSUApc0hakJppNAQX0AnjDIMSoPD/u9KXs1rjaLemUqzwSLwyxg4+R+ef1qbNCtQi7qfjQYWU5/8uv8APnTlwJ7dH1XUgZtzK7TTY5Yzy+8gVrBQbs5AFhkuMbu3Av8AxX/OfuoyKKcLXqSq+oXsGnWct3eSCOGIZYn8vnSBNRv7XTbV7q9mWKFeZJ5/KuX9oftBvb9jBpSvawNsCB/Uf9vpQvWdV1PtjrSRQxuQzcMFuDso8z+prfaJ2a0rspa+13pSa9x4pTvg+SD9a0kxN+ufW3ZLtBexC69jfx78c78LH1Od6U9jtbVSzxwBRzJnXArX6xrtzeyFI3MdueSLzPzPWnpcIkIVttuorSSpYi17LancTiJe5G/vFsj8qmuOx2rwzMkaxyopwHDYBrc2cypbNKqDvGPCjeR86t+0R2aqsiknHWqwOeRdjdalZQyRgD/dnH0o1p/2f29wwSXVis/WExcJ+hNbPTdUtp7pIiAGPrVntBYK3ijbEi+IEcxT9QwOpfZ/d27MbC6yR/25lw30I2oXp+vav2eufZr2OUxg+KKb/wCTW/te00kDi01qH2iDkJRs6/WrWs6LY6xp/EOG5tH3SVffjP6GsrKNVtJ1W11e3E1q+/xIea/OrprlcqX/AGS1rAJK5yp+GVfKuk6Xfw6nZR3VuwKsNx/aeorPrnFLNJStTak3jUVxELiExvy6HyNSUoNAFdOiMFjbxt76xDi+Z3P4mrQNNFOoOFHrXLPtT11p79dIhkxDb4aYA836A/IfnXTrmdbW1muG92JGc/QVwzR7du0HaaGOY8RuZzJKf9u7Gr4n9Ktt2NsIuzWiDV7tAb682hQ81Xp+5+lM1K8nu2Mty/E3IDoPlUHaPU2vdQ7yMcNtB/ThUf2jr9agmk4vdHFnkAK15n9RagVgXBPSrL3SNjJqkhaGWVmO6gHHPG9XpLuBXUvErMfiIqyXrO4QJCCQV4mb8qZ2hvDcXMUFswLnnjoKkuNTEmnmOIqvEOHJG4Wqmi6hBpjd8UWR2HNzv99Mhzs3YRRYk4+8b+7HWjt7JxPni6Y3rP2+t2Hft3YaIzHxFTsvrV/Su+uroo9zE2SeDw5BHTNVLAp3kEdxNgr9cVc0+O60ZDc2rGS3/wC5Cw2IolbXaIhDoiMjEEKKna8t7iMxnZWFKzQBdttDg1nShLaAAOveW58n/t+RrDdg9Se01GTT5wVWTbhPwuOYromlzrHPLosjAxyAy2zH4WHSuZ9qLY6X2t7yPwLI6zL6EnxfrWPXP8VK6UedMPOkgcyQI56jnS1guPVXvrtLODvX3ycBfOp6AapOLm97vnHEPvNT1cK1vxTgKQehpwqlM72/vRZdlrscWHnAhX1yd/wrn32aezJr89xeTRwxxW74aRgAOLbmaL/ahqYubqOwhYFLUEyY38Z/YfnXP3jCuAN/nWvM+JtbNprW4aaCCZJe6YrxKdm9ael0La04O7JKDhfAyRQHQrAowvJ24I/gTkW9flRwGCQ8auA597h3rWfiUBm4gT8EhGARvV/T9Ke6CtKPCOlLo+n+0XILKeEH6Vs7a2VEAXGBtU3oYzkugKY/6YKtjbehf+gXLcKzY4U5Y5mugFYolzKyqPWkAtJNlkTPzrO+WS5aucW/cc+l02W3PhyR5HpU+k6lc2Vz4Qp4emd61moWSKCx4QAM56Vk7xYZENzZOkqqdipyCRWnPSLMbOy1rStUtp/bY1Uxpl9sEfUUHuNOvJbf2mwvFaFt0DDBA8j61m31B0gVOKMMSQ4JxkeXrWl0u5Oq9lry304iK5jQvH1GQP1rTUgelaxHF2gil1C4jU2uQTnrTO3vs+sSJqOnTJLHASJeHmqtjB++sRHmRmc5ywySfOidhMzCS2ycHdvUVnaeNz2XvTcWEPGfEyBf/IbGjZ5msXosvsySpCQXVhLGpPXkR9dq19vL38EcoXh4lBKnptWPUVCXMwggkkJxwqTWas1Mjlz8RJNE+0Ev/wCVYQd5G3+QqDS4s9M7dR/PKsevtLqtrpDiTT7fByAgXJ9Nv0qXUboWOnXV4cYghaTf0Ga57retXljooispmiy5JZdiNuQ/OmaZquoX/YLW/bZZJhHHwrK5555itvVesXeXT3UryysWkkfiY/nVOU5fb1qXiHAcDGTUHvSY3yeorZA5bo2owxlDIoGBjh8OatRwuq8vErcLcPSp4SyQBIOBFjHCpb86eltxqpaeVgDuybCqn4TZaJBGsCso5igyX18n2hCzLv7M0O0fw44c5++i2hSkf0j7ynBo6kETSd73SGTGA2N8fOslQIuC0143GTwx7AVesntmAWRlOfMiql4Db3LMeT7586tWL2rEM6qMc9q4vn569663h65nER6lA0+l3McPxoypvy2rFdndLubHSJo72Pu2aQsFPPGAP0rochVY2IACk5UelZzU5gA3rmut4dnE1zfNnvcZQW5M7nop6daN9lLkW7XKx7zlC/cjYsB5edAWkfv3eNBsfExB2rWdi7JpWudQmJy7BFyu+MDlnpvXo9sjHHLeNhKRuucnHkc1dsXCTMzZyybYGa623ZbQ2Ys2l2xYnJJTnUkXZ3RoG4odNtkbGMrGBWXvFermGm3eL6PngyKvpzre6eSqvCecbYHyq3eadolnBLczWVqEi8TN3YOMUuhalpOpu80cGYw3DKCvAwHpS6uj8AtaVnu4wBkBB+Jq9p0XBAScZ6Vb1zTPYtTngYiTuDjiO2QNwfxFV7yUWlgCfTesbPqaDRQwzMbW9XMYOGBHl/Pwopc21iNGudPtyyh4XRQowASKp6xCY5o7tB/TlA8XIZohpiR3kAbbjX3vP5/z1rZbk5Vliw4wwbBHkarn3tutdJ7Xdm4pbCa6s4wtwo4mUfHj0865wkTySqig5Y4Hzq5dKtPosj30YlnUYDcCjoT50WlugjBQo4VOwO2T5mhtu0dsI7ZDwhMYNRTy8E0kwXMkrZwN8VrE60OlTzR3DyNw5c5wrZrXWN0JRji+lc6t78oQjsGYjddjRfSbuaCUOJFeNvhHwVF5OVuWCOMOAw9aj7q2h3SNBVBJ+IbSJny4qgu7gopZpECjnvms/WLnSTVb9I4WbyFZGS99o4gzAHfGKdquoiVSkZLDqcUJVX76NVYJ3nuk8j6VpIinRPcJMY32J2THI1vOxDO2kSCUMHWdgVbmMYrOaHDFe8cUoGM+CVW91vMVstDRo4Z+JQC02dv+KjP4UvJ/k5+iNI3KlrxGRWCwXWO6Wwu21EKbbhy3CN8UK7KnTmtZ/wDThIN/H3vvctq0t5aR3lu9vKAyOMMD1qjpuiW2kwyrbLjiySSSSdvM09LPqfttIF7QXa596Qf+ooBrLcVvErcmbOPpR3tsIn1+9Zzgqw5DOPCKy8qzaleiGEcRxt6AUpNqLPrX9oNLRLqa1YYtroGSFse63xD6E5+RPlWRsZpdMvykynKnhdfMV1jUrBNQtGhJ4XBDRvj3WHL9j6GsDq+mSXiF1QJewHgdCd8jp+x8jVmuzMktuskR4kcbEdazet6fpUEKTx2UKXRPhdRjHrTtP1A2xNvPkITgqeamh3aVpJb1IYW8BQEN6edVzPooBcGINlmLn+0Cmdw8w8Y4F/tFXo7WODkMnqadwitkKcFuIshds9aJQ2cNmO9uC7u/KINin2UaoGupR4I84B6mqckrzLdTMSW4dvQUBfiuz7MQuEPFxqM/DUYuJJGHc3S8Q5huRqo0bS6fE6DLwDhIHUVWs+BHVm5PsT+tLCozGvtRZJYe5vEPiB5P9f1pA0ZZYY0xFG2WUjOW61etI/aIGSY/14BlW81PWo5LTvLjvQeGQHEgHInz+tVIcohbLZOABbqmeZiPCa0ekLGsDiIuRx78TZ6Cs4LCRkVo88dH9DL+yt3icLB8fgKjy/5XP0RNKDTSdqkjhMkQZWG+9eZZKbLnu3xz4TSKTv6Gg+sauIwYLU+M7O46fKjAr9uJ1ftHfd0yv4wMr5gAHf50X7G6KsMJvbtQeMbBl5/z+ctx3ZnQn1CYXVyhFupzv8RrQ6zczTSrpelBRLjiYnZUUef5fOrS0tB9f0o3Q9rtVHtMa4ZM475R0/5Dp93XYxSiqS5vqGlR6uneQHgvMYHFsJemG8m2xWVk47eV4bqNldPCQ43T0NdY1vRjOzXdkv8AXP8A1Is4E37N+dZy6t7LWo+51INDcJ4EuuHxxkfDIOo/EUS4bBSrg1FjJoxrGh3+iuPaIg9s3uzJ4o39Qw5ULPC2OElWxybbH1rTU2JdS/o2drGNlbLGqVinG8sQ5MholdRG+tYkUhJ4gRh9uIHyqCC3OnRvcTsC5BCLkUyUrCbuGRjuMYYeYpupWns9wSm8Ug4kP51GiHB54NX1HtNiYiMyQniWgLWlXhNskhGWhOG9UOxH60QeTup45tmQnh4hyZTyNZ+wfu5yvF4X2o3bae/GqMxKA54FYVUKNBAineNyN8gGiNqSePJ3yPyqivAYxxwtGw6kEVPb3cKRySSusY4t+I9cVHl/yufq81NN/wCzxeLgCjbJ2oPea2i5W3jLf7m2H3UNiF5qs4SCN55D5cl+flXnxdW7/VZJuKODiVerDYtV7QOzcl6VubzKQdF6tRfQ+ykVrwz3+JJRvwfCtWtT1hkdbPS4zNdMMKqdB5+gHn91PC07Vb9bOOOy0+MNO44I406fzqak0rT/APT4CGYSXEnimk/vPl8h0pulaWLFXlncTXcg8cuNsf2r5D8T1q8TT0L1KK9XqaSjnQbtNYQNZT34UrcxIPGvxDybzr1eoARpd7KnBCeGSCUKGikHEpz6UN7e9mdM060F5ZRNCzHeNW8H0HSvV6mHP2d4uEo5Hp0r1u3tee+UZG+QTXq9VwJpbdImAUtgjrTICYrtCh5869XqZGTRqtyyrsFbbHSjYmdERxgsF6ilr1OEfHqd2VJWZo/RNqrPIxJcnLHmTXq9U9Kg72V0m21WQm8MjBT7qtgV0W2s7ayi7m1hSJABsor1erI2b7U6ncwxyJEwVRjkOeT1otplhBZW47lSXlUNJIxyzn1P6cq9XqAtE1Ga9XqQf//Z'
                      ),
                    ),
                    // Add icon
                    Positioned(
                      bottom: 0,
                      right: -10,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('Tap to add status update'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            title: const Text('Recent Updates'),
            onTap: () {
              // Handle Recent Updates tap
            },
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            title: const Text('Viewed Status'),
            onTap: () {
              // Handle Viewed Status tap
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(statusData[index].imageUrl),
                ),
                title: Text(statusData[index].name),
                subtitle: Text(statusData[index].time),
                onTap: () {
                  // Handle tap on a status item
                },
              );
            },
            childCount: statusData.length,
          ),
        ),
      ],
    );
  }
}

class StatusItem {
  final String imageUrl;
  final String name;
  final String time;

  StatusItem({
    required this.imageUrl,
    required this.name,
    required this.time,
  });
}

List<StatusItem> statusData = [
  StatusItem(
    imageUrl:
        'data:image/jpeg;base64,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',
    name: 'Alice',
    time: 'Today, 10:15 AM',
  ),
  StatusItem(
    imageUrl:
        'data:image/png;base64,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',
    name: 'Bob',
    time: 'Today, 11:30 AM',
  ),
  StatusItem(
    imageUrl:
        'data:image/png;base64,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',
    name: 'Mia',
    time: 'Today, 1:30 AM',
  ),
  StatusItem(
    imageUrl:
        'data:image/jpeg;base64,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',
    name: ' Bruno',
    time: 'Today, 21:30 PM',
  ),
  StatusItem(
    imageUrl:
        'data:image/jpeg;base64,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',
    name: 'Charlie',
    time: 'Today, 1:45 PM',
  ),
  // Add more status items as needed
];

// ignore: duplicate_ignore, duplicate_ignore
class CallsTab extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CallsTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Transform.rotate(
                        angle: -0.5, // Tilt the icon by rotating
                        child: const Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create a link',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Share a link to invite others to join the call',
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
        // Add the list of people with audio and video calls
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // Replace the placeholders with actual data
              final String name = 'Person $index';
              final bool isVideoCall = index % 2 == 0;

              return ListTile(
                onTap: () {
                  // Handle tapping on the person
                },
                leading: CircleAvatar(
                  // Replace with profile image or initials logic
                  child: Text(name[0]),
                ),
                title: Text(name),
                subtitle: Text(isVideoCall ? 'Video call' : 'Audio call'),
                trailing: Icon(
                  isVideoCall ? Icons.videocam : Icons.phone,
                  color: Colors.green,
                ),
              );
            },
            // Adjust the itemCount as needed
            childCount: 10,
          ),
        ),
      ],
    );
  }
}




class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Adjust the color as needed
      child: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Navigate to the full chat screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullChatScreen(chatData[index])),
              );
            },
            leading: const CircleAvatar(
              // Replace with profile image or initials logic
              child: Text('A'),
            ),
            title: Text(chatData[index].name),
            subtitle: Text(chatData[index].lastMessage),
            trailing: Text(chatData[index].time),
          );
        },
      ),
    );
  }
}

class FullChatScreen extends StatelessWidget {
  final ChatItem chatItem;

  const FullChatScreen(this.chatItem);

  @override
  Widget build(BuildContext context) {
    // Implement the UI for the full chat screen using chatItem data
    return Scaffold(
      appBar: AppBar(
        title: Text(chatItem.name),
      ),
      body: Center(
        child: Text('Full Chat Content for ${chatItem.name}'),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
  });
}

List<ChatItem> chatData = [
  ChatItem(name: 'Alice', lastMessage: 'Hi there!', time: '10:15 AM'),
  ChatItem(name: 'Bob', lastMessage: 'How is it going?', time: '11:30 AM'),
  ChatItem(name: 'Charlie', lastMessage: 'Good to see you!', time: '1:45 PM'),
  ChatItem(name: 'David', lastMessage: 'Let us catch up soon.', time: '3:20 PM'),
  ChatItem(name: 'Emily', lastMessage: 'Hello!', time: '4:50 PM'),
  ChatItem(name: 'Frank', lastMessage: 'What is up?', time: '6:15 PM'),
  ChatItem(name: 'Grace', lastMessage: 'I miss you!', time: '7:40 PM'),
  ChatItem(name: 'Henry', lastMessage: 'Busy day today.', time: '9:00 PM'),
  ChatItem(name: 'Ivy', lastMessage: 'See you tomorrow!', time: '10:30 PM'),
  ChatItem(name: 'Jack', lastMessage: 'How was your day?', time: '11:45 PM'),
  ChatItem(name: 'Karen', lastMessage: 'Good night!', time: '12:15 AM'),
  ChatItem(name: 'Leo', lastMessage: 'What are you up to?', time: '1:30 AM'),
  ChatItem(name: 'Megan', lastMessage: 'Have a great day!', time: '2:45 AM'),
  ChatItem(name: 'Nathan', lastMessage: 'It is been a while.', time: '4:00 AM'),
  ChatItem(name: 'Olivia', lastMessage: 'Thinking of you.', time: '5:30 AM'),
  ChatItem(name: 'Paul', lastMessage: 'See you soon!', time: '6:45 AM'),
  ChatItem(name: 'Quinn', lastMessage: 'Let us plan something.', time: '8:00 AM'),
  ChatItem(name: 'Ryan', lastMessage: 'Good morning!', time: '9:15 AM'),
  ChatItem(name: 'Samantha', lastMessage: 'Enjoy your day!', time: '10:45 AM'),
  ChatItem(name: 'Tom', lastMessage: 'Any plans for today?', time: '12:00 PM'),
  // Add more chat items as needed
];



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('WhatsApp'),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEUAgACc+aWRAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 40, // Adjust this value to center higher
                      left: 16,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // Add camera functionality
                            },
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {
                              // Add settings functionality
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 70, // Adjust this value to center higher
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Friday 12.08.24',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12:34 PM', // Replace with your fake time logic
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 70, // Adjust this value to center higher
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Battery',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '80%', // Replace with your fake battery logic
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Add search functionality
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Chats'),
                  Tab(text: 'Status'),
                  Tab(text: 'Calls'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children:  [
            ChatList(),
            StatusTab(),
            const CallsTab(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}


