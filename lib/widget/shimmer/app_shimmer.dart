import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ─── Base shimmer box ──────────────────────────────────────────────────────────
class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const _ShimmerBox({
    required this.width,
    required this.height,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

// ─── Shared shimmer wrapper ────────────────────────────────────────────────────
class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: child,
    );
  }
}

// ─── 1. Home Screen — horizontal reward card list shimmer ──────────────────────
class HomeRewardListShimmer extends StatelessWidget {
  const HomeRewardListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: AppShimmer(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (_, __) => Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShimmerBox(width: 200, height: 160, radius: 16),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ShimmerBox(width: 140, height: 16),
                      const SizedBox(height: 8),
                      _ShimmerBox(width: 100, height: 12),
                      const SizedBox(height: 16),
                      _ShimmerBox(width: 176, height: 36, radius: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── 2. Profile Screen — profile card shimmer ─────────────────────────────────
class ProfileCardShimmer extends StatelessWidget {
  const ProfileCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _ShimmerBox(width: 80, height: 80, radius: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShimmerBox(width: 160, height: 20),
                const SizedBox(height: 8),
                _ShimmerBox(width: 120, height: 14),
                const SizedBox(height: 8),
                _ShimmerBox(width: 140, height: 24, radius: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── 3. Rewards Screen — balance card shimmer ─────────────────────────────────
class RewardsBalanceCardShimmer extends StatelessWidget {
  const RewardsBalanceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerBox(width: 80, height: 20),
            const SizedBox(height: 12),
            Row(
              children: [
                _ShimmerBox(width: 120, height: 28),
                const SizedBox(width: 8),
                _ShimmerBox(width: 60, height: 20),
                const Spacer(),
                _ShimmerBox(width: 28, height: 28, radius: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── 4. Reward Details / Salon Details — full-page shimmer ────────────────────
class DetailPageShimmer extends StatelessWidget {
  const DetailPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header image
          _ShimmerBox(width: double.infinity, height: 300, radius: 0),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShimmerBox(width: 200, height: 28),
                const SizedBox(height: 10),
                _ShimmerBox(width: 140, height: 18),
                const SizedBox(height: 16),
                _ShimmerBox(width: double.infinity, height: 14),
                const SizedBox(height: 6),
                _ShimmerBox(width: double.infinity, height: 14),
                const SizedBox(height: 6),
                _ShimmerBox(width: 220, height: 14),
                const SizedBox(height: 24),
                _ShimmerBox(width: 140, height: 20),
                const SizedBox(height: 12),
                _ShimmerBox(width: double.infinity, height: 100, radius: 12),
                const SizedBox(height: 24),
                _ShimmerBox(width: 140, height: 20),
                const SizedBox(height: 12),
                _ShimmerBox(width: double.infinity, height: 80, radius: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 5. My Visit Screen — reward card list shimmer ────────────────────────────
class RewardCardListShimmer extends StatelessWidget {
  final int itemCount;
  const RewardCardListShimmer({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: List.generate(
          itemCount,
          (i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _ShimmerBox(width: 60, height: 60, radius: 8),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ShimmerBox(width: 140, height: 16),
                        const SizedBox(height: 8),
                        _ShimmerBox(width: 100, height: 13),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _ShimmerBox(width: 64, height: 26, radius: 24),
                      const SizedBox(height: 8),
                      _ShimmerBox(width: 56, height: 24, radius: 50),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── 6. Salon Card — image loading shimmer ────────────────────────────────────
class SalonCardImageShimmer extends StatelessWidget {
  final double width;
  final double height;

  const SalonCardImageShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: _ShimmerBox(width: width, height: height, radius: 16),
    );
  }
}

// ─── 7. Button loading shimmer (replaces LoadingWidget) ───────────────────────
class ButtonLoadingShimmer extends StatelessWidget {
  final Color? buttonColor;
  const ButtonLoadingShimmer({super.key, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
