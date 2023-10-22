
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/counter/counter_bloc.dart';
import 'package:flutter_bloc_app/theme/theme_cubit.dart';

class CounterPage extends StatelessWidget{

  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return CounterBloc();
      },
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget{
  
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc,int>(
                builder: (context,count){
                  return Text(
                    '$count' , style: Theme.of(context).textTheme.displayMedium,
                  );
                }
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  onPressed: ()=> context.read<CounterBloc>().add(IncrementEvent()),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Minus'),
                  onPressed: ()=> context.read<CounterBloc>().add(DecrementEvent()),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.brightness_6),
          onPressed: () => context.read<ThemeCubit>().changeTheme()),
    );
  }
}