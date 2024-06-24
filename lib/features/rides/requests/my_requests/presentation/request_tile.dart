import 'package:buscar/common_widgets/skeleton.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {
  final Widget origin;
  final Widget destination;
  final Widget date;
  final Widget status;
  final bool isLoading;
  final VoidCallback? onAccept; // Adicionar callback onAccept

  const RequestTile({
    super.key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.status,
    required this.isLoading,
    this.onAccept, // Adicionar ao construtor
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SkeletonCard()
        : ListTile(
            minVerticalPadding: 20,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.home,
                  size: 22,
                ),
                const SizedBox(width: 5),
                Expanded(
                    child: Row(
                  children: [const Text('De: '), origin],
                )),
                status,
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.place,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    child: Row(
                      children: [const Text('Para: '), destination],
                    ),
                  ),
                  date
                ],
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.check),
              onPressed: onAccept, // Chamar callback onAccept ao clicar
            ),
            onTap: () {},
          );
  }
}

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            children: [
              Icon(
                Icons.home,
                size: 20,
              ),
              SizedBox(width: 10),
              Skeleton(height: 20, width: 50),
              SizedBox(width: 5),
              Skeleton(height: 20, width: 200)
            ],
          )),
          Skeleton(
            height: 20,
            width: 60,
          ),
        ],
      ),
      subtitle: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.place,
              size: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Skeleton(height: 20, width: 50),
                  SizedBox(width: 5),
                  Skeleton(height: 20, width: 170)
                ],
              ),
            ),
            Skeleton(height: 20, width: 80)
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
